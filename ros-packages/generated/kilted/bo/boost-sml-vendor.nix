{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "boost_sml_vendor";
  version = "1.1.13-1";
  src = finalAttrs.passthru.sources."boost_sml_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "boost_sml_vendor" = substituteSource {
      src = fetchgit {
        name = "boost_sml_vendor-source";
        url = "https://github.com/ros2-gbp/boost_sml_vendor-release.git";
        rev = "cc18fef0b5ec22ad643b4360fbd29e9404a5e084";
        hash = "sha256-75LebnRhxq3/3VfdThrtyhLp5haHVWgemuebZULSgKI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE git";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/boost-ext/sml.git";
          to = "VCS_TYPE path VCS_URL ${sources."boost_sml_vendor/sml"}";
        }
      ];
    };
    "boost_sml_vendor/sml" = substituteSource {
      src = fetchgit {
        name = "sml-source";
        url = "https://github.com/boost-ext/sml.git";
        rev = "8015e095dab82c03eb2277258645956bcd84cbcb";
        hash = "sha256-VgJl09kCRCXBF/IraVbAVowrrMJH0NFcblQAKVQwl6w=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for the Boost SML (State Machine Language)\n  ";
  };
})
