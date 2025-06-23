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
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."tecgihan_driver";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python-is-python3" "python3-serial" ]; };
  propagatedBuildInputs = [ geometry-msgs rclpy xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python-is-python3" "python3-serial" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tecgihan_driver" = substituteSource {
      src = fetchgit {
        name = "tecgihan_driver-source";
        url = "https://github.com/tecgihan/tecgihan_driver-release.git";
        rev = "a8cbb2c65f0a5480ff93057c120e1b4ebdc599e6";
        hash = "sha256-qUK7haQeSAe6Ju1wtTdUr8vATIoNB8/Z1UFWZ47AOqE=";
      };
    };
  });
  meta = {
    description = "Linux and ROS driver software for Tec Gihan sensor amplifiers for robots";
  };
})
