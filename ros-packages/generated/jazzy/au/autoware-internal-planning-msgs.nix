{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-perception-msgs,
  autoware-planning-msgs,
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
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_internal_planning_msgs";
  version = "1.5.0-2";
  src = finalAttrs.passthru.sources."autoware_internal_planning_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ autoware-perception-msgs autoware-planning-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_planning_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_planning_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "5f6fc62acf03532fd92bc5463d57f3d96a8b49f1";
        hash = "sha256-R31PW2F8sqm3ciCE4c+V8LjatN2oQfP0iF1AVaoQPsY=";
      };
    };
  });
  meta = {
    description = "The autoware_internal_planning_msgs package";
  };
})
