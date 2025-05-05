{
  ament-cmake,
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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realsense2_camera_msgs";
  version = "4.55.1-3";
  src = finalAttrs.passthru.sources."realsense2_camera_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "realsense2_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "realsense2_camera_msgs-source";
        url = "https://github.com/IntelRealSense/realsense-ros-release.git";
        rev = "def1802d06398e80848aea8958ce2321d1c439d1";
        hash = "sha256-uL0BZSHsWOr4JF0PxcIJa6XvMAWzM+MVRW7SacxABH4=";
      };
    };
  });
  meta = {
    description = "RealSense camera_msgs package containing realsense camera messages definitions";
  };
})
