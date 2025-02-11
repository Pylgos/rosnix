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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."yasmin";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-cov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin" = substituteSource {
      src = fetchgit {
        name = "yasmin-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "c041d1733265fb84d57fb66dc6b785ad8da000b7";
        hash = "sha256-j7OEYcpeBM6aSiBkJipc3BXtYpl4Mql4UWcXST2hlt8=";
      };
    };
  });
  meta = {
    description = "YASMIN (Yet Another State MachINe) main package";
  };
})
