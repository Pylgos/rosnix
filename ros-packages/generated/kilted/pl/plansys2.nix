{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-bringup,
  plansys2-bt-actions,
  plansys2-core,
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-lifecycle-manager,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-popf-plan-solver,
  plansys2-problem-expert,
  plansys2-support-py,
  plansys2-terminal,
  plansys2-tools,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ plansys2-bringup plansys2-bt-actions plansys2-core plansys2-domain-expert plansys2-executor plansys2-lifecycle-manager plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-popf-plan-solver plansys2-problem-expert plansys2-support-py plansys2-terminal plansys2-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-bringup plansys2-bt-actions plansys2-core plansys2-domain-expert plansys2-executor plansys2-lifecycle-manager plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-popf-plan-solver plansys2-problem-expert plansys2-support-py plansys2-terminal plansys2-tools ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2" = substituteSource {
      src = fetchgit {
        name = "plansys2-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "26ec4355fa1b29eb988d8bbc2fbe30b26b01fc52";
        hash = "sha256-4O9Ej8x6gPpyHr8ZzG5DdqL0/aNy4Z+usFmdYALUTt4=";
      };
    };
  });
  meta = {
    description = "ROS2 Planning System";
  };
})
