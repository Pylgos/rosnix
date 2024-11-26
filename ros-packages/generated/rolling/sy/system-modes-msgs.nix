{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "system_modes_msgs";
  version = "0.9.0-5";
  src = finalAttrs.passthru.sources."system_modes_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "system_modes_msgs" = substituteSource {
        src = fetchgit {
          name = "system_modes_msgs-source";
          url = "https://github.com/ros2-gbp/system_modes-release.git";
          rev = "54ca985a62ba5234ccc4578a795f722e79168f9d";
          hash = "sha256-UcVnvMWo1lcz8PljlXg4m53YoUKsphq4TbfgB7Z3dgw=";
        };
      };
    });
  };
  meta = {
    description = "Interface package, containing message definitions and service definitions for the system modes package.";
  };
})
