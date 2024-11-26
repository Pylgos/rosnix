{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pcl_msgs";
  version = "1.0.0-8";
  src = finalAttrs.passthru.sources."pcl_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "pcl_msgs" = substituteSource {
        src = fetchgit {
          name = "pcl_msgs-source";
          url = "https://github.com/ros2-gbp/pcl_msgs-release.git";
          rev = "63649a08e304edddf086a71ed8e0c213ec45159d";
          hash = "sha256-YdspDlpwU8CIVBKEa3kLCnDsR3MsuehC9zuvXtAnt4w=";
        };
      };
    });
  };
  meta = {
    description = "Package containing PCL (Point Cloud Library)-related ROS messages.";
  };
})
