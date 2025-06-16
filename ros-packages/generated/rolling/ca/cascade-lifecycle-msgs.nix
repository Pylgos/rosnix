{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cascade_lifecycle_msgs";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."cascade_lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces lifecycle-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces lifecycle-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cascade_lifecycle_msgs" = substituteSource {
      src = fetchgit {
        name = "cascade_lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "4d9181445ad6380c5e982bbe90fe0239808cac9f";
        hash = "sha256-dSN04MLPNKTxfvpT2Wul+ln6Ans91RxqYXtxZjzOgjI=";
      };
    };
  });
  meta = {
    description = "Messages for rclcpp_cascade_lifecycle package";
  };
})
