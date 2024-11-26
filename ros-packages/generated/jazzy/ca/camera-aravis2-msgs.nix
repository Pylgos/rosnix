{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
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
  pname = "camera_aravis2_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."camera_aravis2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "camera_aravis2_msgs" = substituteSource {
        src = fetchgit {
          name = "camera_aravis2_msgs-source";
          url = "https://github.com/ros2-gbp/camera_aravis2-release.git";
          rev = "779f712fb162187e4c606b1dc4f533d39939481c";
          hash = "sha256-uJNlVnQ0C6eoW8P7lIvVPeQwCegOvlodYxLCKO6fv1Q=";
        };
      };
    });
  };
  meta = {
    description = "Messages and service definitions for the camera_aravis2 package.";
  };
})
