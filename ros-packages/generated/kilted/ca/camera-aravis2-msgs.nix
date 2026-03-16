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
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."camera_aravis2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "camera_aravis2_msgs" = substituteSource {
      src = fetchgit {
        name = "camera_aravis2_msgs-source";
        url = "https://github.com/ros2-gbp/camera_aravis2-release.git";
        rev = "bdd34bdf14415ddfcff9596752dfbdbb19cb8282";
        hash = "sha256-QCFVDrlHSZ3rHr7DxU7A3Wzst1+imf+MJ2vjXXM7wsg=";
      };
    };
  });
  meta = {
    description = "Messages and service definitions for the camera_aravis2 package.";
  };
})
