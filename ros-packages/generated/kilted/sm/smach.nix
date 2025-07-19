{
  ament-cmake,
  ament-cmake-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "smach";
  version = "3.0.3-3";
  src = finalAttrs.passthru.sources."smach";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  passthru.sources = mkSourceSet (sources: {
    "smach" = substituteSource {
      src = fetchgit {
        name = "smach-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "be214151ef2beaec4354084505d6277dd2e8848b";
        hash = "sha256-vyRxq6EM6nOhjwQFIV+ikGPs5Wr0pb7e9iAq8+R8cwo=";
      };
    };
  });
  meta = {
    description = "\n    SMACH is a task-level architecture for rapidly creating complex robot\n    behavior. At its core, SMACH is a ROS-independent Python library to build\n    hierarchical state machines. SMACH is a new library that takes advantage of\n    very old concepts in order to quickly create robust robot behavior with\n    maintainable and modular code.\n  ";
  };
})
