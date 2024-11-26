{
  ament-cmake,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "apriltag_msgs";
  version = "2.0.1-4";
  src = finalAttrs.passthru.sources."apriltag_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "apriltag_msgs" = substituteSource {
        src = fetchgit {
          name = "apriltag_msgs-source";
          url = "https://github.com/ros2-gbp/apriltag_msgs-release.git";
          rev = "555203ded954f72af530a0415c8ba5b356669d8c";
          hash = "sha256-8gmaJqHmANuH5XDGCZ8C29KjCY7QKQ8r2DSpl1jxp20=";
        };
      };
    });
  };
  meta = {
    description = "AprilTag message definitions";
  };
})
