{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_msgs";
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."velodyne_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_msgs" = substituteSource {
      src = fetchgit {
        name = "velodyne_msgs-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "ef6471bd871d07facea9caa683a7876c060995ce";
        hash = "sha256-iscfIy80Wu1MlKkXs2oJbpaRXU44PgxQIfgA1DrrA6w=";
      };
    };
  });
  meta = {
    description = "\n    ROS message definitions for Velodyne 3D LIDARs.\n  ";
  };
})
