{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_xml";
  version = "3.4.4-1";
  src = finalAttrs.passthru.sources."launch_xml";
  propagatedNativeBuildInputs = [ launch ];
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_xml" = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "59f253b9a9c7f40849a5838d1fe11551beac4aa8";
        hash = "sha256-CiRXti8nFdOjAA6ma/ddpZZDiO031S/8JfEY6bIbJPs=";
      };
    };
  });
  meta = {
    description = "XML frontend for the launch package.";
  };
})
