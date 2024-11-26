{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "grbl_msgs";
  version = "0.0.2-8";
  src = finalAttrs.passthru.sources."grbl_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grbl_msgs" = substituteSource {
        src = fetchgit {
          name = "grbl_msgs-source";
          url = "https://github.com/ros2-gbp/grbl_msgs-release.git";
          rev = "ff01ab1af1a4b9fb91850243c3e97d66664c0f12";
          hash = "sha256-cjvc4arr+Z92IcwzqZryuU4FC2MY+FNpA+6JBe0dhiE=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 Messages package for GRBL devices";
  };
})
