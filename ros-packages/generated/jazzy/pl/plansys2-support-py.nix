{
  ament-cmake,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  plansys2-msgs,
  python-cmake-module,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "plansys2_support_py" = substituteSource {
      src = fetchgit {
        name = "plansys2_support_py-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "2f90c243fa38b85b8118a396d29c373a93e68358";
        hash = "sha256-oxIVaJxovAH4rLHm0iqe1O3yD12Yx8eQFaBJNABmfaw=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_support_py";
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_support_py";
  nativeBuildInputs = [ ament-cmake python-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lifecycle-msgs plansys2-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "This package contains modules for developing PlanSys components in Python";
  };
})
