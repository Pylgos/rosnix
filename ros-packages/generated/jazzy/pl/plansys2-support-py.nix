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
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_support_py";
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_support_py";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedBuildInputs = [ lifecycle-msgs plansys2-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "plansys2_support_py" = substituteSource {
      src = fetchgit {
        name = "plansys2_support_py-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "2f90c243fa38b85b8118a396d29c373a93e68358";
        hash = "sha256-oxIVaJxovAH4rLHm0iqe1O3yD12Yx8eQFaBJNABmfaw=";
      };
    };
  });
  meta = {
    description = "This package contains modules for developing PlanSys components in Python";
  };
})
