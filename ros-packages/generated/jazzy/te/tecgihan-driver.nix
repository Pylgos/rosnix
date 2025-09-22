{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tecgihan_driver";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."tecgihan_driver";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-serial" ]; };
  propagatedBuildInputs = [ geometry-msgs rclpy xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tecgihan_driver" = substituteSource {
      src = fetchgit {
        name = "tecgihan_driver-source";
        url = "https://github.com/tecgihan/tecgihan_driver-release.git";
        rev = "04c1645b354569a757b2dc1b3864f9167d303745";
        hash = "sha256-mu9E2FEaTfQQHE+G/R5FRwcjWvWgDKxrWNIpEhkHxAg=";
      };
    };
  });
  meta = {
    description = "Linux and ROS driver software for Tec Gihan sensor amplifiers for robots";
  };
})
