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
  version = "0.0.2-9";
  src = finalAttrs.passthru.sources."grbl_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grbl_msgs" = substituteSource {
      src = fetchgit {
        name = "grbl_msgs-source";
        url = "https://github.com/ros2-gbp/grbl_msgs-release.git";
        rev = "1f12681ffa6e6b30748f6c8b88aa8cb82e4d73e2";
        hash = "sha256-cjvc4arr+Z92IcwzqZryuU4FC2MY+FNpA+6JBe0dhiE=";
      };
    };
  });
  meta = {
    description = "ROS2 Messages package for GRBL devices";
  };
})
