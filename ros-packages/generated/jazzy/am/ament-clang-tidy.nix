{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_clang_tidy";
  version = "0.17.5-1";
  src = finalAttrs.passthru.sources."ament_clang_tidy";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4cedeb659e5045050b07e7e136bde58c28dd3903";
        hash = "sha256-03IKMqin/tb6ePYusvq7HTYksjBoAft6mPbnx2xWBgA=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against style conventions using\n    clang-tidy and generate xUnit test result files.";
  };
})
