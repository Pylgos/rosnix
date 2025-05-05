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
  version = "0.9.0-6";
  src = finalAttrs.passthru.sources."system_modes_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "system_modes_msgs" = substituteSource {
      src = fetchgit {
        name = "system_modes_msgs-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "0ca34ba1a38941ce091a31331eb78be7520efec9";
        hash = "sha256-UcVnvMWo1lcz8PljlXg4m53YoUKsphq4TbfgB7Z3dgw=";
      };
    };
  });
  meta = {
    description = "\n    Interface package, containing message definitions and service definitions\n    for the system modes package.\n  ";
  };
})
