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
  pname = "flir_camera_msgs";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."flir_camera_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "flir_camera_msgs-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "87f5a3dc73e04bf81ed93cf669453d8aaf13a325";
        hash = "sha256-6+GJ3lS8t5ZSmuyd/+Szm5J+hHtqhYT9qEOF9rKAKTQ=";
      };
    };
  });
  meta = {
    description = "messages related to flir camera driver";
  };
})
