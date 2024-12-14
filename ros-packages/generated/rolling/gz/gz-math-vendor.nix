{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_math_vendor";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."gz_math_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "gz-math8" "pybind11-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_math_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-source";
        url = "https://github.com/ros2-gbp/gz_math_vendor-release.git";
        rev = "563dfba4a7cad06bc8214b2a30b5d844cae9eaeb";
        hash = "sha256-Wj1uVdEdzK6Nj/Gtrn/EJv8UcRae+9BQWfzGy4Lzz30=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_math_vendor/gz-math"}";
        }
      ];
    };
    "gz_math_vendor/gz-math" = substituteSource {
      src = fetchgit {
        name = "gz-math-source";
        url = "https://github.com/gazebosim/gz-math.git";
        rev = "2179284cb6fe77f42001c4797e060c034d8e92dc";
        hash = "sha256-3jQk98HJ0ru2Q4fTqoiaPRaIHaWQKQlnqj+gN2PLxkE=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-math8 8.1.0 Gazebo Math : Math classes and functions for robot applications";
  };
})
