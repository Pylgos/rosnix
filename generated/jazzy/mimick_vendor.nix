{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    mimick_vendor = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "1be11e576e4ab6745b5fa85c3dc3147b79523679";
        hash = "sha256-wQW/rdoXG6vBtOKZi4dSPTuRv1vmyfVQzzwmj2hOZ20=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros2/Mimick.git";
          to = "VCS_TYPE path VCS_URL ${mimick_vendor-vendor_source-Mimick-0}";
        }
      ];
    };
    mimick_vendor-vendor_source-Mimick-0 = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-vendor_source-Mimick-0-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "9af748b88f6d48723275006ccbb0360e50342dbb";
        hash = "sha256-3f5T8gTOLxMeYcaYDlAefXMKXP4Wv3xkUWBag07H+0I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mimick_vendor";
  version = "0.6.1-2";
  src = sources.mimick_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around mimick, it provides an ExternalProject build of mimick.";
  };
}
