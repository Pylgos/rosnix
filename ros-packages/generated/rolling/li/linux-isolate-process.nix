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
  pname = "linux_isolate_process";
  version = "0.0.2-2";
  src = finalAttrs.passthru.sources."linux_isolate_process";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "linux_isolate_process" = substituteSource {
      src = fetchgit {
        name = "linux_isolate_process-source";
        url = "https://github.com/ros2-gbp/linux_isolate_process-release.git";
        rev = "29df07675ca7bea9449807ebca430ee161e82988";
        hash = "sha256-1MOoCotNkz3eD3lwztz0QfmCyDxEk36KY1YmdCQIjK4=";
      };
    };
  });
  meta = {
    description = "A tool to isolate ros2 nodes";
  };
})
