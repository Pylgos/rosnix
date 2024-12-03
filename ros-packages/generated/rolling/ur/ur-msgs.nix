{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."ur_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ur_msgs" = substituteSource {
      src = fetchgit {
        name = "ur_msgs-source";
        url = "https://github.com/ros2-gbp/ur_msgs-release.git";
        rev = "d56593a8c0b0646db43c25bb0407e9fe12d54dd6";
        hash = "sha256-7cH9WwTKM++V1UGgmtuDaaf1LnoFpGzdy353ywB4I14=";
      };
    };
  });
  meta = {
    description = "Message and service definitions for interacting with Universal Robots robot controllers.";
  };
})
