{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "magic_enum";
  version = "0.9.7-2";
  src = finalAttrs.passthru.sources."magic_enum";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "magic_enum" = substituteSource {
      src = fetchgit {
        name = "magic_enum-source";
        url = "https://github.com/ros2-gbp/magic_enum-release.git";
        rev = "2b485e1cc2b41417e0f0f90a5e0f0c33dc210582";
        hash = "sha256-ShCQSq1kMlVtziAd6tAiSkrffeoQZFvMVLRaxVK3mhw=";
      };
    };
  });
  meta = {
    description = "\n    Static reflection for enums (to string, from string, iteration) for modern C++,\n    work with any enum type without any macro or boilerplate code\n  ";
  };
})
