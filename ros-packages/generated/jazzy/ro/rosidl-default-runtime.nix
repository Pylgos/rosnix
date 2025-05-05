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
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_default_runtime";
  version = "1.6.0-3";
  src = finalAttrs.passthru.sources."rosidl_default_runtime";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-core-runtime service-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-core-runtime service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_default_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "d25a92b065e9f454ed6e96e89c07d61cc7f96ce9";
        hash = "sha256-vjsipJB0+/VPIsA3LK9gH6WS/Eai0uZ3YKW3TRptp7Y=";
      };
    };
  });
  meta = {
    description = "A configuration package defining the runtime for the ROS interfaces.";
  };
})
