{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-pycodestyle,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  uncrustify-vendor,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_uncrustify";
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_uncrustify";
  propagatedNativeBuildInputs = [ uncrustify-vendor ];
  propagatedBuildInputs = [ uncrustify-vendor ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-pycodestyle ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "bf252358876cc44b14445d54e76c2df9ef01a274";
        hash = "sha256-53xjpeoosDfKf9dvjGSUVgpb3GRtl+HwVbc3j3Coayk=";
      };
    };
  });
  meta = {
    description = "The ability to check code against style conventions using uncrustify and generate xUnit test result files.";
  };
})
