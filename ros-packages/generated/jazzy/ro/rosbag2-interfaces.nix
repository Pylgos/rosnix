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
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."rosbag2_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_interfaces" = substituteSource {
      src = fetchgit {
        name = "rosbag2_interfaces-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "bcde8ab3572f665a612220817295a480faaf905a";
        hash = "sha256-wpiCE5qs+ejsZDHDbSKRhPPui8xcORBffLWCUUpD8HE=";
      };
    };
  });
  meta = {
    description = "Interface definitions for controlling rosbag2";
  };
})
