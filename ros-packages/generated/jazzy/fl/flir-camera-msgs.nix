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
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."flir_camera_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flir_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "flir_camera_msgs-source";
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "9882bb776296cbd06beb8419fb6cd6c0205e5307";
        hash = "sha256-eyROPCacIut3kAK/WWPWqV5joMM26saSJUddZwk1+mI=";
      };
    };
  });
  meta = {
    description = "messages related to flir camera driver";
  };
})
