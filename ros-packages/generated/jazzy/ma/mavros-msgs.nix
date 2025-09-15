{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mavros_msgs";
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."mavros_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geographic-msgs geometry-msgs rcl-interfaces rosidl-default-runtime sensor-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geographic-msgs geometry-msgs rcl-interfaces rosidl-default-runtime sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mavros_msgs" = substituteSource {
      src = fetchgit {
        name = "mavros_msgs-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "14fb2af62c992f7ab4e8e8ecc737a1ca499147e3";
        hash = "sha256-m1wckrhBzlxHhhmRoKn98XqmaZaDg2lhlSRxLcVI7ew=";
      };
    };
  });
  meta = {
    description = "\n    mavros_msgs defines messages for ";
  };
})
