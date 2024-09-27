{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tinyspline-vendor_source-5f0e8fad34e86771cfae3dac4beef5f1858d5610 = substituteSource {
      src = fetchgit {
        name = "tinyspline-vendor_source-5f0e8fad34e86771cfae3dac4beef5f1858d5610-source";
        url = "https://github.com/msteinbeck/tinyspline.git";
        rev = "5f0e8fad34e86771cfae3dac4beef5f1858d5610";
        hash = "sha256-cvnnVT04R2QnFKsf/lxzkDmxgalAPFw8hGC33HyNsIQ=";
      };
      substitutions = [
      ];
    };
    tinyspline_vendor-a06565ed4aff7d2c19a4a058ea3f43323075b2ab = substituteSource {
      src = fetchgit {
        name = "tinyspline_vendor-a06565ed4aff7d2c19a4a058ea3f43323075b2ab-source";
        url = "https://github.com/ros2-gbp/tinyspline_vendor-release.git";
        rev = "a06565ed4aff7d2c19a4a058ea3f43323075b2ab";
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
          to = "VCS_TYPE path VCS_URL ${tinyspline-vendor_source-5f0e8fad34e86771cfae3dac4beef5f1858d5610}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyspline_vendor";
  version = "0.6.1-1";
  src = sources.tinyspline_vendor-a06565ed4aff7d2c19a4a058ea3f43323075b2ab;
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
