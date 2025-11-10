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
  version = "1.1.12-1";
  src = finalAttrs.passthru.sources."boost_sml_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "boost_sml_vendor" = substituteSource {
      src = fetchgit {
        name = "boost_sml_vendor-source";
        url = "https://github.com/ros2-gbp/boost_sml_vendor-release.git";
        rev = "e79943b754e988e2b7aa8fd2e078203b89302d48";
        hash = "sha256-cqeL+fLPbbcj53LRKSqLv/mRk2U4+3gz9ioEfToLtr4=";
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
        rev = "cd3ef80206b71463de96d6b682cfdc99703ec147";
        hash = "sha256-IvZwkhZe9pcyJhZdn4VkWMRUN6Ow8qs3zB6JtWb5pKk=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for the Boost SML (State Machine Language)\n  ";
  };
})
