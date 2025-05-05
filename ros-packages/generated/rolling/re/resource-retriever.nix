{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libcurl-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "resource_retriever";
  version = "3.8.0-1";
  src = finalAttrs.passthru.sources."resource_retriever";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp ament-index-python libcurl-vendor ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp ament-index-python libcurl-vendor ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "resource_retriever" = substituteSource {
      src = fetchgit {
        name = "resource_retriever-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "1e2625bc1a7a9a78419c4914d3a783df36132820";
        hash = "sha256-Id+hOH8RHA3Op9Vrh2n2u8XS4Z2gBJaRxmyL2pdolD8=";
      };
    };
  });
  meta = {
    description = "\n   This package retrieves data from url-format files such as http://,\n   ftp://, package:// file://, etc., and loads the data into memory.\n   The package:// url for ros packages is translated into a local\n   file:// url.  The resourse retriever was initially designed to load\n   mesh files into memory, but it can be used for any type of\n   data. The resource retriever is based on the the libcurl library.\n  ";
  };
})
