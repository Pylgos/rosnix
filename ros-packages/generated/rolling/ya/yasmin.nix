{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."yasmin";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin" = substituteSource {
      src = fetchgit {
        name = "yasmin-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "c9803f6ae7c9316f7976104a9a71c0777a522dec";
        hash = "sha256-6OD1WCLBnymhE3NPMoLEPynZ7Hwy2oUJJlL+XQAt/ss=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) main package";
  };
})
