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
  version = "3.0.2-1";
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
        rev = "895563f54fb0106d9e251df7fad8db9ce1b5dd26";
        hash = "sha256-L7hII/HTsXuxMpzKEoRx2oL2Jx36vcqmWAU3xc8Ez2U=";
      };
    };
  });
  meta = {
    description = "messages related to flir camera driver";
  };
})
