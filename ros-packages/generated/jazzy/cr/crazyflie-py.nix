{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  crazyflie-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "crazyflie_py";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."crazyflie_py";
  propagatedNativeBuildInputs = [ crazyflie-interfaces rclpy ];
  propagatedBuildInputs = [ crazyflie-interfaces rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_py" = substituteSource {
      src = fetchgit {
        name = "crazyflie_py-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "77f7e9ac9539641cb444fde621c75e0e5bdb5bfd";
        hash = "sha256-mdssM6k0iCzkfIFeqAqOlBSplCb8ixgZb7+M6mB3qB8=";
      };
    };
  });
  meta = {
    description = "Simple Python Interface for Crayzswarm2";
  };
})
