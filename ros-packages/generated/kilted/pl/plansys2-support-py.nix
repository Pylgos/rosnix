{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  plansys2-msgs,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "plansys2_support_py";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_support_py";
  propagatedNativeBuildInputs = [ lifecycle-msgs plansys2-msgs rclpy ];
  propagatedBuildInputs = [ lifecycle-msgs plansys2-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "plansys2_support_py" = substituteSource {
      src = fetchgit {
        name = "plansys2_support_py-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "0559fa39aa1cbea5ba93d5a26f218d149678f876";
        hash = "sha256-HcpSVolPDvSMOMd3YeBobY8Nd3aB+VMCh2iY3WtzOmk=";
      };
    };
  });
  meta = {
    description = "This package contains modules for developing PlanSys components in Python";
  };
})
