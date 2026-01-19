{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-common-msgs,
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
  version = "1.12.1-1";
  src = finalAttrs.passthru.sources."autoware_internal_planning_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ autoware-common-msgs autoware-perception-msgs autoware-planning-msgs builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ autoware-common-msgs autoware-perception-msgs autoware-planning-msgs builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_planning_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_planning_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "ecf35429de86408880e2b547d888e5c85425dc8d";
        hash = "sha256-egimivPqKxXPl1o3NJz2uCeXy4az7BknTPtKXGIglA0=";
      };
    };
  });
  meta = {
    description = "The autoware_internal_planning_msgs package";
  };
})
