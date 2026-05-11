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
  version = "0.34.0-1";
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
        rev = "ed7f4f7d5aa5f7467f3707ccb6be9c5e94f9329c";
        hash = "sha256-BxLD7rQVeF14Xu/S3mwJltRuQHP0/wFFKlKyvFThpJc=";
      };
    };
  });
  meta = {
    description = "Interface definitions for controlling rosbag2";
  };
})
