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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_interfaces";
  version = "0.32.0-1";
  src = finalAttrs.passthru.sources."rosbag2_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_interfaces" = substituteSource {
      src = fetchgit {
        name = "rosbag2_interfaces-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "295e7b749e6093454c7c41183c59c6e3e1e4169c";
        hash = "sha256-nPcq3WbRcLhb2qQC3betghh4D5eJ/kyAdAXpbXLcVIU=";
      };
    };
  });
  meta = {
    description = "Interface definitions for controlling rosbag2";
  };
})
