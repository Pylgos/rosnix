{
  action-msgs,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flexbe_msgs";
  version = "4.0.3-2";
  src = finalAttrs.passthru.sources."flexbe_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "flexbe_msgs" = substituteSource {
      src = fetchgit {
        name = "flexbe_msgs-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "0972ca17ae7aec95974bf3a7a9f68975510794f1";
        hash = "sha256-jXDPVkAdAzg6QlmJuwcUhz6mHKEqjwTYK2ZgWdh/CzM=";
      };
    };
  });
  meta = {
    description = "\n        flexbe_msgs provides the messages used by FlexBE.\n    ";
  };
})
