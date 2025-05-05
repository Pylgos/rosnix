{
  ament-cmake-ros,
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
  pname = "rosbridge_msgs";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."rosbridge_msgs";
  nativeBuildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbridge_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "0d036e38d04260b87daa8bc845f26adfa97bcb0d";
        hash = "sha256-C7DCMNvAhvfgqD5QqfYuZSEQ/3ccnOvx5zWH3uIwbJY=";
      };
    };
  });
  meta = {
    description = "Package containing message files";
  };
})
