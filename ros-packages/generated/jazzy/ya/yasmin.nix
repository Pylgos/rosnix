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
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."yasmin";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin" = substituteSource {
      src = fetchgit {
        name = "yasmin-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "0954cd6962a1fa3c8ed3b2924a533794649ecb11";
        hash = "sha256-39GJjeAjYp7juYpYfgJyqZn9i3ZK23F7LtSwS5oc2j0=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) main package";
  };
})
