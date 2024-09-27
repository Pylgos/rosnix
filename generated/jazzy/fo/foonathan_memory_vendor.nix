{
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    foonathan_memory_vendor-446ac182791f3c0ab3817f3b503c38954e6a0133 = substituteSource {
      src = fetchgit {
        name = "foonathan_memory_vendor-446ac182791f3c0ab3817f3b503c38954e6a0133-source";
        url = "https://github.com/ros2-gbp/foonathan_memory_vendor-release.git";
        rev = "446ac182791f3c0ab3817f3b503c38954e6a0133";
        hash = "sha256-LmTgr8JI5jo23rCSvEeq6WSeCvLx/dmYpqtNx0hZ7lE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
          to = "URL ${memory-vendor_source-0f0775770fd1c506fa9c5ad566bd6ba59659db66}";
        }
      ];
    };
    memory-vendor_source-0f0775770fd1c506fa9c5ad566bd6ba59659db66 = substituteSource {
      src = fetchgit {
        name = "memory-vendor_source-0f0775770fd1c506fa9c5ad566bd6ba59659db66-source";
        url = "https://github.com/foonathan/memory.git";
        rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
        hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foonathan_memory_vendor";
  version = "1.3.1-3";
  src = sources.foonathan_memory_vendor-446ac182791f3c0ab3817f3b503c38954e6a0133;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_test ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Foonathan/memory vendor package for Fast-RTPS.";
  };
}
