{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "scenario_execution_interfaces";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_interfaces" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_interfaces-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "c98f287f62d1b299f19302f38696df0a48280553";
        hash = "sha256-TyRmYJWJ7jUQ2JCKIcLvoXFUubsy7Quveu1aONsDsnw=";
      };
    };
  });
  meta = {
    description = "ROS2 Interfaces for Scenario Execution";
  };
})
