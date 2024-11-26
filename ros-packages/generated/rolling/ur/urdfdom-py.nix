{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "urdfdom_py";
  version = "1.2.1-2";
  src = finalAttrs.passthru.sources."urdfdom_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom_py" = substituteSource {
      src = fetchgit {
        name = "urdfdom_py-source";
        url = "https://github.com/ros2-gbp/urdfdom_py-release.git";
        rev = "63259c8319609c2dcd7e7fff99db12ce70f88a1a";
        hash = "sha256-XIQzb/e4G8nvo/oqr/BKyEWW1LAFi2kvQhIdXhJHG+Q=";
      };
    };
  });
  meta = {
    description = "Python implementation of the URDF parser.";
  };
})
