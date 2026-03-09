{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mbf_msgs";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."mbf_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mbf_msgs" = substituteSource {
      src = fetchgit {
        name = "mbf_msgs-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "fef48d4320584e32b319037c4e835b053c0d7e01";
        hash = "sha256-TmSNY0BhIgtkBK+UzFUu4f/5tBiqOlT78HeLW88V3TU=";
      };
    };
  });
  meta = {
    description = "\n      The move_base_flex messages package providing the action definition files for the action GetPath, ExePath, Recovery and MoveBase. The action servers providing these action are implemented in ";
  };
})
