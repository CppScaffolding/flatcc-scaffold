-- scaffold geniefile for flatcc

flatcc_script = path.getabsolute(path.getdirectory(_SCRIPT))
flatcc_root = path.join(flatcc_script, "flatcc")

flatcc_includedirs = {
	path.join(flatcc_script, "config"),
	flatcc_root,
}

flatcc_libdirs = {}
flatcc_links = {}
flatcc_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { flatcc_includedirs }
	end,

	_add_defines = function()
		defines { flatcc_defines }
	end,

	_add_libdirs = function()
		libdirs { flatcc_libdirs }
	end,

	_add_external_links = function()
		links { flatcc_links }
	end,

	_add_self_links = function()
		links { "flatcc" }
	end,

	_create_projects = function()

project "flatcc"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		flatcc_includedirs,
	}

	defines {}

	files {
		path.join(flatcc_script, "config", "**.h"),
		path.join(flatcc_root, "**.h"),
		path.join(flatcc_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
