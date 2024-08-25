{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    tinyspline_vendor = substituteSource {
      src = fetchgit {
        name = "tinyspline_vendor-source";
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
          to = "VCS_TYPE path VCS_URL ${tinyspline_vendor-vendor_source-tinyspline-0}";
        }
      ];
    };
    tinyspline_vendor-vendor_source-tinyspline-0 = substituteSource {
      src = fetchgit {
        name = "tinyspline_vendor-vendor_source-tinyspline-0-source";
        url = "https://github.com/msteinbeck/tinyspline.git";
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
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The vendor package for tinyspline.";
  };
}
