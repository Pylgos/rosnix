{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tinyspline_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "tinyspline_vendor-source";
        owner = "ros2-gbp";
        repo = "tinyspline_vendor-release";
        rev = "7111e62de13b24ad4ce963d3ad82031459ec9a02";
        hash = "sha256-mQi06924EtNw7quRVGSQDJ2EFYqUCOsq37JO/eH/gJE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE git";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/msteinbeck/tinyspline.git";
          to = "VCS_TYPE path VCS_URL ${tinyspline_vendor-vendor_source-tinyspline-0}";
        }
      ];
    };
    tinyspline_vendor-vendor_source-tinyspline-0 = substituteSource {
      src = fetchFromGitHub {
        name = "tinyspline_vendor-vendor_source-tinyspline-0-source";
        owner = "msteinbeck";
        repo = "tinyspline";
        rev = "5f0e8fad34e86771cfae3dac4beef5f1858d5610";
        hash = "sha256-cvnnVT04R2QnFKsf/lxzkDmxgalAPFw8hGC33HyNsIQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyspline_vendor";
  version = "0.6.1-1";
  src = sources.tinyspline_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The vendor package for tinyspline.";
  };
}
