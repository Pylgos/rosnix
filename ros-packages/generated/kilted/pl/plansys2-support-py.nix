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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."plansys2_support_py";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ lifecycle-msgs plansys2-msgs rclpy ];
  buildInputs = [ ament-cmake python-cmake-module ];
  propagatedBuildInputs = [ lifecycle-msgs plansys2-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "plansys2_support_py" = substituteSource {
      src = fetchgit {
        name = "plansys2_support_py-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "65690517825e51bb828e2c2253633341339e6221";
        hash = "sha256-Rj013FYGOegPS2w10WsfNPbOoWyqVxHGXJPcBzs00ro=";
      };
    };
  });
  meta = {
    description = "This package contains modules for developing PlanSys components in Python";
  };
})
