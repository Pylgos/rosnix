{
  ament_cmake_auto,
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
    hash_library_vendor = substituteSource {
      src = fetchgit {
        name = "hash_library_vendor-source";
        url = "https://github.com/ros2-gbp/hash_library_vendor-release.git";
        rev = "cd243a064b6da2fcbd714575e2dd3d6158af7901";
        hash = "sha256-/aXRAfmumq2WRfhcS24fzeg13YY+hDi9NQYpVUQNR6w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/stbrumme/hash-library.git";
          to = "URL ${hash_library_vendor-vendor_source-hash-library-0}";
        }
      ];
    };
    hash_library_vendor-vendor_source-hash-library-0 = substituteSource {
      src = fetchgit {
        name = "hash_library_vendor-vendor_source-hash-library-0-source";
        url = "https://github.com/stbrumme/hash-library.git";
        rev = "70cc93763d49a24c4536c7f0a23248f9b40e30f5";
        hash = "sha256-z4JzmggZnNfsTD8OzBiX4egJax4qJXGYr2Q8GPrInRI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hash_library_vendor";
  version = "0.1.1-7";
  src = sources.hash_library_vendor;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 vendor package for stbrumme/hash-library";
  };
}
